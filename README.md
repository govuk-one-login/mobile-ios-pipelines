# mobile-ios-pipelines
Reusable scripts and pipelines for building, testing and reporting on iOS repositories.

The workflow can be called from GitHub actions as a step:

```yaml
steps:
  - name: Run iOS workflow
    uses: govuk-one-login/mobile-ios-pipelines@main
    with:
      scheme: MyScheme
      sonar_token: ${{ secrets.MY_SONAR_TOKEN }}
```

If used as part of a pull request workflow, the pipeline will:
- Checkout the code
- Run static code analysis (such as linting)
- Select a version of Xcode to use for future steps
- Run tests defined by the scheme
- Upload results to SonarCloud
- Ensure that SonarCloud results pass to required level

If the GitHub Action was triggered by a different action, such as a merge or workflow dispatch, then the workflow will also:
- Checkout the code
- Select a version of Xcode to use for future steps
- Run tests defined by the scheme
- Upload results to SonarCloud for the default branch
- Determine the new semantic version number using conventional commits
- Create a new release for the repo with the semantic version
