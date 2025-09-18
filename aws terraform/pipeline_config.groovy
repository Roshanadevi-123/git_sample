jte {
    pipeline_template = "devsecops_pipeline.groovy"
}
libraries{
    pipeline_common {
        branchToEnvironmentMapping = [[
                /^develop$/ : "dev",
                /^master$/ : "test",
                /^(feature|bugfix|hotfix)\/.+/ : "features",
        ]]
        concurrentBuilds = false
        notifyOnFixedEnvs = ["dev", "test"]
        notifyOnFailedEnvs = ["dev", "test"]
        notificationEmailOnFixed = "roshanadevi.ruthala@merck.com"
        notificationEmailOnFailed = "roshanadevi.ruthala@merck.com"
    }
    git {
        gitCredentialsId = "srvautofestcicd-pat"
        gitleaksExitCode = 0
        gitleaksConfigPath = ".gitleaks.toml"
        gitleaksVerbose = true
        gitleaksArchiveOutput = true
    }
    scan {
      // checkov {
      //     checkovDirectory = "iac"
      //     checkovConfigFile = ".checkov.yaml"
      //     checkovCredentialsId = "srvautofestcicd-pat"
      //     checkovArchiveOutput = true
      // }
      terraform {
        terraformWorkDir = "iac"
        terraformFmtAdditionalArgs = "-recursive -check -diff"
        terraformCredentialsId = "srvautofestcicd-pat"
      }
    wiz 
      {
        wizScanType = "iac"
      }
    }
 //Fill in the information when you have CD project/pipeline prepared
    deploy {
      cloudbees {
          cloudBeesConfigurationName = "CCD_Prod"
          cloudBeesCredentialsId = "srvautofestcicd-pass"
          cloudBeesProjectName = "autofest-iac"
          cloudBeesPipelineName = "autofest-DEV"
      }
    }

    promote {
       cloudbees {
            cloudBeesConfigurationName = "CCD_Prod"
            cloudBeesReleaseStartingStage = "Release Readiness"
            cloudBeesCredentialsId = "srvautofestcicd-pass"
            cloudBeesProjectName = "autofest-iac"
            cloudBeesReleaseName = "autofest-REL-1.0"
            cloudBeesReleasePipelineName = "pipeline_autofest-release"
        }
    }
}
