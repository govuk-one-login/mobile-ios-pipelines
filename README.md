# mobile-ios-pipelines
Reusable scripts and pipelines for building, testing and reporting on iOS repositories.

The workflow can be called from GitHub actions as a step:

```yaml
steps:
  - name: Run iOS workflow
    uses: govuk-one-login/mobile-iOS-pipelines@main
    with:
      action_type: 'Pull Request' | 'Merge'
      workspace: MyWorkspace.xcworkspace (optional if standalone package)
      scheme: MyScheme
      xcode_version: 15
      run_destination: platform=iOS Simulator,name=iPhone 15,OS=17.5
      sonar_token: ${{ secrets.MY_SONAR_TOKEN }}
      github_token: ${{ secrets.MY_GITHUB_TOKEN }} (only needed for 'Merge' action)
```

If used as part of a pull request workflow, the pipeline will:
- Checkout the code
- Run static code analysis (such as linting)
- Select a version of Xcode to use for future steps
- Run tests defined by the scheme
- Upload results to SonarCloud
- Ensure that SonarCloud results pass to required level

If used as part of a merge workflow, the pipeline will:
- Checkout the code
- Select a version of Xcode to use for future steps
- Run tests defined by the scheme
- Upload results to SonarCloud for the main branch
- Determine the new semantic version number using conventional commits
- Create a new release for the repo with the semantic version
