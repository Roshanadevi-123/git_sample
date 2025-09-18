jte {
    pipeline_template = 'release_pipeline.groovy'
}

libraries {
    pipeline_common {
        concurrentBuilds = false
        notificationEmailOnFixed = "roshanadevi.ruthalar@merck.com"
        notificationEmailOnFailed = "roshanadevi.ruthalar@merck.com"
        notificationMicrosoftTeamWebHook = 'dostack-pipeline-lib-test-teams-webhook'
    }
    release_common {
        gitUrl = 'https://github.com/merck-gen/autofest-iac.git'
        gitCredentialsId = 'srvautofestcicd-pat'
        gitWipeWorkspace = true
        waitForUpstreamBuild = true
    }
    release {
        generic {
            releaseCredentialsId = 'srvautofestcicd-pat'
            gitCommentPrefix = 'WB-0:'
            versioningAllowInitialReleaseVersion = true
            versioningPushReleaseBranch = true
            versioningTemplate = 'version_file'
        }
    }
}
