
## Welcome
Thank you for contributing to **SQL50 Interview Prep**. This project follows a disciplined, team‑grade workflow designed for clarity, reproducibility, and long‑term resilience. Please read and follow these guidelines before submitting changes.

---

## Workflow Overview

### Clone the repository
```bash
git clone git@github.com:varaprasadchilakanti/SQL50.git  
cd SQL50
```

### Create a feature branch
```bash
git checkout -b feature/<short-description>
```
Example: `feature/basic-select`

Synchronize with remote before committing
```bash
git fetch origin  
git pull --rebase origin main
```

### Stage changes selectively
```bash
git add select/  
git diff --cached
```

### Commit with professional messaging
```bash
git commit -m "Add Q001_Recyclable_Low_Fat_Products with structured SQL solution"
```

### Push branch
```bash
git push origin feature/basic-select
```

### Open a Pull Request  
- Ensure CI checks pass (lint/tests).
- Request review from teammates.

### Merge to main  
- After approval, rebase and merge.
- Locally update:
```bash
git checkout main  
git pull --rebase origin main
```

---

## Commit Message Convention

**Prefixes:** Add, Refactor, Fix, Docs, Test, Chore 
**Subject line:** ≤ 72 characters, imperative mood 
**Optional body:** rationale, context, decisions 

Examples: 
- `Add Q001_Recyclable_Low_Fat_Products.sql with SELECT filtering solution` 
- `Refactor joins module for clarity and ANSI SQL alignment` 
- `Docs: update README with aggregate functions overview` 

Reference: [Conventional Commits](https://www.conventionalcommits.org/)

---

## Coding Standards

- **File naming:** `Q<question_number>_<slug>.sql`
- **Style:** ANSI SQL preferred, clear indentation, aliases for readability
- **Architecture:** modular queries using CTEs, clean separation of concerns
- **Tests:** validate against sample datasets, ensure correctness and edge case handling

---

## Collaboration Practices

- **Branch protection:** `main` is protected; all changes via Pull Request
- **CI/CD:** GitHub Actions run SQL lint and test validations
- **Documentation:** Update README when structure or intent changes
- **Hygiene:** `.gitignore` excludes editor/system artifacts

---

## Troubleshooting

**SSH agent not running:**
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

**Permission denied (publickey):**
- Verify key added to GitHub
- Test with:
```bash
ssh -T git@github.com
```

**Merge conflicts:**
```bash
git status
# resolve conflicts
git add <resolved-files>
git rebase --continue
```

---

## References

- [Git Book](https://git-scm.com/book/en/v2)
- [GitHub SSH setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub Branch Protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches) 
- [ANSI SQL Standards Documentation](https://www.iso.org/standard/63555.html)

