resource "random_id" "project_suffix" {
  byte_length = 3
}

resource "google_project" "project" {
    name            = var.project_name
    project_id      = "${var.project_prefix}-${random_id.project_suffix.hex}"
    billing_account = var.billing_account_id
}

resource "google_project_service" "enabled_apis" {
    for_each = toset(var.activate_apis)

    project = google_project.project.project_id
    service = each.key
    disable_on_destroy = false
}

resource "google_service_account" "deployer" {
    project      = google_project.project.project_id
    account_id   = "github-actions-deployer"
    display_name = "GitHub Actions CI/CD Deployer"
    depends_on   = [google_project_service.enabled_apis]
}

resource "google_project_iam_member" "deployer_roles" {
    for_each = toset([
        "roles/run.admin",
        "roles/storage.admin",
        "roles/artifactregistry.writer",
        "roles/iam.serviceAccountUser",
        "roles/secretmanager.admin"
    ])

    project = google_project.project.project_id
    role    = each.key
    member  = "serviceAccount:${google_service_account.deployer.email}"
}