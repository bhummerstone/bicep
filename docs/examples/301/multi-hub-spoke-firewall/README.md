Note: this template creates Resource Groups, so must be deployed at Subscription level. To do so change the following items after running "bicep build":
- Change the $schema to "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#"
- Run 'az deployment sub create' to deploy the template