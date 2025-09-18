jobs {
    "jte-multibranch-job" {
        jobType = "MULTIBRANCH_JOB_JTE"
        jteConfig {
            configBaseDir = "pipeline-configuration"
        }
    }
    "release-job" {
        jobType = "PIPELINE_JOB_JTE"
        environmentVariables = [
        IS_RELEASE: "true",
        UPSTREAM_JOB: "jte-multibranch-job/develop"
       ]
     jteConfig {
     pipelineConfigurationPath = "pipeline-configuration/release_pipeline.groovy"
        }
    }
}
