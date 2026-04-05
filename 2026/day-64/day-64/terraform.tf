terraform {
	required_providers{
	aws = {
	source = "hashicorp/aws"
	version = "6.38.0"
	}
	}

	backend s3 {
        bucket = "terraweek-state-aaryan"
        # use_lockfile = true 
        dynamodb_table = "terraweek-state-lock"
        key = "dev/terraform.tfstate"
        encrypt = true
		region = "ap-south-1"
    }
}

