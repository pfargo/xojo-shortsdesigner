#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin ExternalIDEScriptStep RetinaEnable
					AppliesTo = 0
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
