# discord-stock-ticker

This chart is for @rssnyder's discord-stock-ticker. I had to make a custom
image to get the configmap working to inject bots into the api with persistence.
Discord bot tokens are stored in the secrets file encoded in base64.
Thanks to k8s@home for the common library

You can use env variables if you like or use the configmap in the values.yaml
and/or store your base64 encoded bot tokens in templates/secrets.yaml.
