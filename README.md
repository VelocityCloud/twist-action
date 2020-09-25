# twist-action

A GitHub Action to send a message to a Twist thread. It uses the webhooks API.

## Usage

You can use this action in any workflows. Here is an example:

```yaml
on: push
name: Twist notification
jobs:
  do-something:
    name: Notify Twist
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Notify Twist about something
        uses: VelocityCloud/twist-action@master
        with:
          message: Hello, world!
        env:
          TWIST_WEBHOOK_URL: ${{ secrets.TWIST_WEBHOOK_URL }}
```
