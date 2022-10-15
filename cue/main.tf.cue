resource: {
	aws_route53_zone: cueniform_com: name: "cueniform.com"
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
			records: ["66.111.4.53", "66.111.4.54"]
		}
	}
}
