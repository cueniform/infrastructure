package terraform

import "cueniform.com/infrastructure/cnifm"

cnifm.#Validate

configuration: {
	resource: {
		aws_route53_zone: cueniform_com: {
			name: "cueniform.com"
			lifecycle: prevent_destroy: true
		}
		aws_route53_record: {
			cueniform_com_A: {
				name:    "cueniform.com"
				zone_id: "${aws_route53_zone.cueniform_com.zone_id}"
				type:    "A"
				ttl:     3600
				records: ["66.111.4.53", "66.111.4.54"]
			}
			www_cueniform_com_A: {
				name:    "www.cueniform.com"
				zone_id: "${aws_route53_zone.cueniform_com.zone_id}"
				type:    "A"
				ttl:     3600
				records: cueniform_com_A.records
			}
		}
	}
	variable: {
		"provider-aws-domains-access_key_id": type:     "string"
		"provider-aws-domains-role_arn": type:          "string"
		"provider-aws-domains-secret_access_key": type: "string"
	}
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
	terraform: {
		required_version: "~> 1.4.6"
		required_providers: aws: {
			source:  "hashicorp/aws"
			version: "5.1.0"
		}
	}
	output: cueniform_com_NS: {
		value: "${resource.aws_route53_zone.cueniform_com.name_servers}"
	}
	terraform: cloud: {
		// organization: string // set via envvar
		hostname: "app.terraform.io"
		workspaces: tags: ["cueniform", "infrastructure"]

	}
}
