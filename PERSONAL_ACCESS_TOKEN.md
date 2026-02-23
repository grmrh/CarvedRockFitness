# How to Create a Personal Access Token (PAT)

A Personal Access Token (PAT) is a secure way to authenticate with GitHub when using Git operations, GitHub APIs, or other services that require authentication. Tokens are more secure than passwords and can be scoped to specific permissions.

## Prerequisites

- A GitHub account
- Access to the repository you want to work with

## Steps to Create a Personal Access Token

### 1. Access Token Settings

1. Log in to your GitHub account
2. Click on your profile picture in the top-right corner
3. Select **Settings** from the dropdown menu
4. Scroll down to the bottom of the left sidebar and click on **Developer settings**
5. Click on **Personal access tokens**
6. Choose one of the following options:
   - **Tokens (classic)** - for classic tokens with granular scope selection
   - **Fine-grained tokens** - for more specific repository access (recommended)

### 2. Generate a New Token

#### For Fine-grained Tokens (Recommended):

1. Click **Generate new token** → **Generate new token (fine-grained)**
2. Fill in the required information:
   - **Token name**: Give your token a descriptive name (e.g., "CarvedRockFitness-Dev")
   - **Expiration**: Choose an expiration date (recommended: 90 days or less)
   - **Description**: Optional description of what the token is for
   - **Resource owner**: Select the account or organization
   - **Repository access**: Choose which repositories this token can access:
     - **Only select repositories**: Choose specific repositories
     - **All repositories**: Access to all your repositories
3. Set **Repository permissions** based on your needs:
   - **Contents**: Read and write (for cloning, pulling, pushing)
   - **Pull requests**: Read and write (for creating and managing PRs)
   - **Issues**: Read and write (for managing issues)
   - **Metadata**: Read-only (automatically included)
4. Review the permissions summary
5. Click **Generate token**

#### For Classic Tokens:

1. Click **Generate new token** → **Generate new token (classic)**
2. Fill in the required information:
   - **Note**: Give your token a descriptive name (e.g., "CarvedRockFitness-Dev")
   - **Expiration**: Choose an expiration date (recommended: 90 days or less)
3. Select the scopes/permissions you need:
   - **repo**: Full control of private repositories (most common for development)
   - **workflow**: Update GitHub Action workflows
   - **read:org**: Read org and team membership
   - **write:packages**: Upload packages to GitHub Package Registry
4. Scroll down and click **Generate token**

### 3. Save Your Token

**⚠️ IMPORTANT:** After generating the token, **copy it immediately** and store it in a secure location. You will not be able to see it again!

- Do not share your token with anyone
- Do not commit it to your repository
- Store it in a password manager or secure note
- Treat it like a password

### 4. Use Your Token

#### For Git Operations:

When Git prompts you for a password, use your Personal Access Token instead:

```bash
# Clone a repository
git clone https://github.com/username/repository.git
Username: your_username
Password: your_personal_access_token

# Or configure Git to store credentials
git config --global credential.helper store
```

#### For GitHub CLI:

```bash
# Authenticate with GitHub CLI
gh auth login
# Select HTTPS and paste your token when prompted
```

#### For GitHub API:

```bash
# Use token in API requests
curl -H "Authorization: token YOUR_TOKEN" https://api.github.com/user
```

## Managing Your Tokens

### Viewing Existing Tokens

1. Go to **Settings** → **Developer settings** → **Personal access tokens**
2. You can see all your active tokens, their permissions, and expiration dates
3. Tokens do not display their actual value after creation

### Updating Token Permissions

- **Fine-grained tokens**: Can be edited to change permissions
- **Classic tokens**: Cannot be edited; you must create a new token

### Revoking a Token

1. Go to your token list
2. Click **Delete** or **Revoke** next to the token you want to remove
3. Confirm the deletion

**Revoke tokens immediately if:**
- The token is compromised or exposed
- You no longer need the access
- The token is used for a completed project

## Best Practices

1. **Use Fine-grained Tokens**: They provide better security with specific repository access
2. **Set Expiration Dates**: Use the shortest expiration time practical for your use case
3. **Limit Permissions**: Only grant the minimum permissions needed
4. **Regular Rotation**: Regenerate tokens periodically (every 90 days recommended)
5. **Use Separate Tokens**: Create different tokens for different purposes or machines
6. **Never Commit Tokens**: Keep tokens out of your code and configuration files
7. **Use Environment Variables**: Store tokens in environment variables or secure vaults
8. **Monitor Usage**: Regularly review your active tokens and revoke unused ones

## Troubleshooting

### Token Not Working

- Verify the token hasn't expired
- Check that the token has the necessary permissions
- Ensure you're copying the entire token without spaces
- Try regenerating the token if issues persist

### Permission Denied

- Verify the token has access to the specific repository
- Check that the required scopes are enabled
- For organization repositories, ensure the token is authorized for the organization

### Token Exposed

If you accidentally commit a token to a repository:
1. **Immediately revoke the token** on GitHub
2. Generate a new token
3. Remove the token from your Git history using tools like `git-filter-branch` or `BFG Repo-Cleaner`
4. Update any services using the old token

## Additional Resources

- [GitHub Documentation: Creating a Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [GitHub Documentation: Token Expiration and Revocation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/token-expiration-and-revocation)
- [GitHub Security Best Practices](https://docs.github.com/en/code-security/getting-started/securing-your-account-and-data)

## Need Help?

If you encounter issues creating or using your Personal Access Token, please:
1. Review the GitHub documentation linked above
2. Check the repository's issues page for similar problems
3. Contact the repository maintainers
4. Reach out to GitHub Support for account-specific issues
