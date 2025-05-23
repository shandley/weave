# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

1. **DO NOT** open a public issue
2. Email security@weave-project.dev with:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

## Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 5 business days
- **Resolution Timeline**: Depends on severity
  - Critical: Within 7 days
  - High: Within 14 days
  - Medium: Within 30 days
  - Low: Within 60 days

## Security Measures

Weave implements several security measures:

- All code execution happens in isolated containers
- Context-aware safety constraints
- No persistent credentials in containers
- Comprehensive audit logging
- Regular dependency updates

## Disclosure Policy

- We will notify affected users within 24 hours of patch release
- Public disclosure will happen 7 days after patch release
- Credit will be given to reporters (unless anonymity requested)

## Security Best Practices for Users

1. Keep Weave updated to the latest version
2. Review safety constraints before enabling autonomous mode
3. Regularly audit execution logs
4. Use strong authentication for API access
5. Follow principle of least privilege

Thank you for helping keep Weave secure!