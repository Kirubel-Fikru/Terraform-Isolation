# Terraform-Isolation
Store Terraform state in multiple, separate, named workspaces.
## VIA Workspace
Terraform workspaces allow you to store your Terraform state in multiple,
separate, named workspaces. Terraform starts with a single workspace
called “default,” and if you never explicitly specify a workspace, the default
workspace is the one you’ll use the entire time. To create a new workspace
or switch between workspaces, you use 
```
terraform workspace
```
## VIA File Layout

With this approach, the use of separate folders makes it much clearer which
environments you’re deploying to, and the use of separate state files, with
separate authentication mechanisms, makes it significantly less likely that a
screw-up in one environment can have any impact on another.