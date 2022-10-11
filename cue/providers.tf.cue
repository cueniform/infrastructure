provider: aws: {
	region:     "eu-west-2"
	access_key: "${var.provider-aws-domains-access_key_id}"
	assume_role: {
		external_id:  "j4kfmjdlw940fjs"
		role_arn:     "${var.provider-aws-domains-role_arn}"
		session_name: "Terraform-Cloud"
	}
	secret_key: "${var.provider-aws-domains-secret_access_key}"
}
terraform: required_providers: aws: {
	source:  "hashicorp/aws"
	version: "4.34.0"
}
