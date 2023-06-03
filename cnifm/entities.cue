package cnifm

entities: {
	aws_route53_zone: #Resource: {
		name!:              string
		comment?:           string
		delegation_set_id?: string
		force_destroy?:     bool
		tags?: {
			[string]: string
		}
		vpc?: _
	}
	aws_route53_record: #Resource: {
		zone_id!: string
		name!:    string
		type!:    string
		ttl?:     int
		records?: [...string]
	}
}
