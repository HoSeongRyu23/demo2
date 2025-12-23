# SAP FCM Training Sandbox - Project Tutorial

Welcome to the **SAP FCM Training Sandbox (Learning-ERP)** project tutorial. This document guides you through the project setup and development workflow, based on the materials we have created so far.

## 1. Project Overview
The **SAP FCM Training Sandbox** is a web-based simulator designed to provide a risk-free environment for learning SAP FI/CO processes. It focuses on visualizing the flow of data from logistics (SD) to finance (FI) and controlling (CO).

*   **Goal**: Create a "Zero Risk" sandbox for SAP practice.
*   **Key Features**: Scenario-based missions, Real-time CO-PA analysis, and Error simulation.
*   **Tech Stack**: React/Next.js (Frontend), Node.js/Python (Backend), PostgreSQL (DB).

For more details, please refer to the [Product Requirements Document](DOCS/PRD.md).

## 2. Prerequisites
Before setting up the project, ensure you have the following installed:

*   **Git**: For version control.
*   **GitHub CLI (`gh`)**: For managing the repository and issues via command line.
    *   *Verification*: Run `gh --version` in your terminal.

## 3. Getting Started (Setup)
We have provided a PowerShell script to automate the initial repository setup and issue tracking.

### Running the Setup Script
The `setup_github.ps1` script performs the following actions:
1.  **Checks for GitHub CLI**: Ensures `gh` is available.
2.  **Creates Repository**: If the repository `sap-fcm-training-sandbox` does not exist, it creates one (public) and pushes the current code.
3.  **Creates Issues**: Reads `docs/Tasks.md` and converts the task list into GitHub Issues.

#### How to Run
Open PowerShell in the project root directory and execute:

```powershell
./setup_github.ps1
```

> **Note**: You may need to authorize the GitHub CLI (`gh auth login`) if you haven't done so previously.

## 4. Development Workflow
The project follows a phase-based development approach as outlined in [Tasks.md](DOCS/Tasks.md).

### Tracking Progress
After running the setup script, your GitHub repository assuming `Docs/Tasks.md` format was correct will be populated with issues corresponding to the phases:

*   **Phase 1**: Environment Setup
*   **Phase 2**: Database Modeling
*   **...**

### Next Steps
1.  **Select a Task**: Go to the GitHub Issues tab (or use `gh issue list`) and pick a task from **Phase 1**.
2.  **Implementation**: Follow the requirements in the PRD.
3.  **Update Progress**: Mark the task as clean in `docs/Tasks.md` and close the corresponding GitHub Issue.

## 5. Directory Structure
*   `DOCS/`: Contains project documentation (PRD, Tasks).
*   `setup_github.ps1`: Automation script for project initialization.
*   `.gitignore`: Git ignore rules.

---
*Created based on Project Assets as of 2025-12-23*
