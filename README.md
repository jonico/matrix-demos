# matrix-demos

Demos to show PlanetScale DB capabilities with a common matrix topic / visualization. All demos are browser based - either using Codespaces or GitHub Actions and should run out of the box. The Action based demos also work with the free community tier as long as you are not using crazy dimensions for the matrices.

## Demos included so far

### Codespace based examples
* [Demo how many parallel connections we support](codespace-based-demos.md#how-to-use-parallel-connection-test-demo)

![image](https://user-images.githubusercontent.com/1872314/136703003-84724233-bdce-483b-b1ac-fb6e6e331aa4.png)

* [Demo how non-blocking schema changes work](codespace-based-demos.md#how-to-use-non-blocking-schema-change-demo)

![image](https://user-images.githubusercontent.com/1872314/137904594-ddf38ea5-d63f-4d52-b300-89eae0ff0dd1.png)

### Action based examples

The [Action based demos](action-based-demos.md) do not need Codespaces but offer a similar functionality (with a slightly longer startup time).
If you click on the Actions tab of your repo, you will see the suggested workflows to run starting from 01.

![image](https://user-images.githubusercontent.com/1872314/140483434-d3ee5ce9-1b19-4196-b1ba-08395a525d8f.png)

## Before you start exploring

### A Sign up for a PlanetScale account

If you have not done already, [sign up here](https://auth.planetscale.com/sign-up) for a PlanetScale account, you can have one database for free. Do not create a database yet though, this step will be automated as part of the demos.

### B Create your own copy of this repository template

If somebody from your team has already configured the demos in a copy of the original repository and you like to share - this is fine. In order to run a CodeSpace you would need membership write write acces to the repository. Otherwise, just create a copy of this repository template by clicking on the green 'Use this template' button. Both private as well as public repo visibility will work.

![image](https://user-images.githubusercontent.com/1872314/141356169-d1dcc996-9e3f-41bc-b4cb-c96b5f0cb843.png)


### C Decide whether you like to use GitHub Codespaces or GitHub Actions for the demo

GitHub CodeSpaces will provide faster performance and the ability to use the same repo for multiple people, but you need to sign up (and probably pay) for CodeSpace usage. When you decide to use the GitHub Actions based demo flow instead, demo startup will take a little longer. On the other hand, GitHub provides GitHub Action minutes for free for public repositories and also provides a generous amount of free Action minutes for private repositories.

It is ultimately your choice - and also possible to run the demos with both CodeSpaces and Actions.

If you decide for Actions, [follow this document](action-based-demos.md), for Codespaces - continue [here](codespace-based-demos.md).
