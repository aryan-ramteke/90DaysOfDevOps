# Day 39 – What is CI/CD?

## Task
Before writing a single pipeline, understand **why CI/CD exists** and what it actually does.

Today is a research and diagram day — no pipelines yet. Get the concepts right first.

---

## Expected Output
- A markdown file: `day-39-cicd-concepts.md`
- A pipeline diagram (hand-drawn or text-based)

---

## Challenge Tasks

### Task 1: The Problem
Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:
1. What can go wrong?
-> If all developers pushes code, it'll cause the application to fail. Sometime it may overwrite the previous code written by somebody else ie cause conflicts.
Also without proper testing it might cause any bug.

2. What does "it works on my machine" mean and why is it a real problem?
-> It works on my machine means the application runs perfectly in the local environment which has complete setup done to run the application. It is a problem because the same code might not work on someone else laptop or environment due to many reasons. Reasons can be the OS, missing packages or dependency, unclear instructions. 
3. How many times a day can a team safely deploy manually?
-> Many times but it is not acceptable.
---

### Task 2: CI vs CD
Research and write short definitions (2-3 lines each):
1. **Continuous Integration** — what happens, how often, what it catches
-> What happens: Developers frequently merge code changes into a shared repository, triggering automated processes like building the application, running tests, and validating the integrated codebase.
How often: Multiple times a day, ideally after every commit or pull request to ensure rapid feedback.
What it catches: Early detection of integration issues, such as merge conflicts, broken builds, test failures, and incompatibilities between code changes from different developers.

2. **Continuous Delivery** — how it's different from CI, what "delivery" means
-> 1. How it's different from CI: CI focuses on frequent integration, building, and testing of code changes to catch issues early. CD extends CI by automating the deployment of validated code to staging or pre-production environments, ensuring the software is always in a releasable state, but production deployment requires manual approval.
2. What "delivery" means: "Delivery" refers to the automated preparation and packaging of software for release, including builds, tests, and deployments to non-production environments, making it ready for production at any time upon human decision.
3. Real-world example: An e-commerce platform uses CD to automatically deploy updates to a staging server after CI tests pass, allowing QA teams to verify functionality before manually approving production release.

3. **Continuous Deployment** — how it differs from Delivery, when teams use it
->How it differs from Delivery: Continuous Deployment extends Continuous Delivery by fully automating the release process to production without manual approval. Once code passes all CI/CD stages (build, test, deploy to staging), it is automatically deployed to production, eliminating human intervention for faster, more frequent releases.
When teams use it: Teams adopt it when they have robust automated testing, monitoring, and rollback mechanisms, allowing rapid iteration and deployment (e.g., multiple times a day) in environments where downtime is minimal and user feedback is immediate, such as web apps or APIs.
Real-world example: A streaming service like Netflix uses Continuous Deployment to automatically push code changes to production after automated tests, enabling daily releases and quick feature rollouts while relying on canary deployments for safety.

Continuous Integration (CI): Focuses on automating the build and testing of code changes.
Continuous Deployment: Automatically deploys every change that passes tests directly to production.
Continuous Delivery: Ensures the code is always ready to be deployed to production, but usually requires a human decision to push to production.
---

### Task 3: Pipeline Anatomy
A pipeline has these parts — write what each one does:
- **Trigger** — what starts the pipeline
- **Stage** — a logical phase (build, test, deploy)
- **Job** — a unit of work inside a stage
- **Step** — a single command or action inside a job
- **Runner** — the machine that executes the job
- **Artifact** — output produced by a job
->
Trigger – the event that kicks the pipeline off (push, pull request, schedule, etc.)
Stage – a named phase in the flow (e.g. build → test → deploy) used to group related work
Job – one unit of work executed in a stage; jobs run sequentially or in parallel depending on configuration
Step – a single command or action inside a job (run a script, call an action, install deps)
Runner – the actual machine/agent (hosted or self‑hosted) that carries out the job’s steps
Artifact – any file or bundle produced by a job (build output, test reports) that can be stored or passed to later jobs
---

### Task 4: Draw a Pipeline
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Include at least 3 stages. Hand-drawn and photographed is perfectly fine.
->  Dev(code) -> push (centralised vcs like github) -> Testing -> Build (docker image) -> Deploy
---

### Task 5: Explore in the Wild
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
2. Find their `.github/workflows/` folder
3. Open one workflow YAML file
4. Write in your notes:
   - What triggers it?
   -> It is triggered by pushing code changes to master or creating opened or synchronize pull requests.
   - How many jobs does it have?
   -> 4 jobs
   - What does it do? (best guess)
   -> it is building some docs


---