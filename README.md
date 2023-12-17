# kill-the-newsletter (fly.io)

This is a docker instance of [kill-the-newsletter](https://github.com/leafac/kill-the-newsletter) designed to be hosted on [fly.io](https://fly.io).

Fly has an excellent free tier, but at current pricing this will cost $2/mth because it requires a private ip address. This is because kill-the-newsletter requires additional non-standard ports open, which fly [forces to have a private ip](https://fly.io/docs/js/the-basics/listening-ports/).

## Install

1. Set up fly account. Install [flyctl](https://fly.io/docs/hands-on/install-flyctl/) on your local machine.

2. clone this repo.

3. in `fly.toml` and `configuration.js` replace `goohayee` with your own app name and `goohayee.fly.dev` with your app url.

4. run `fly launch`

5. run `fly ips allocate-v4` to allocate a private ip (this will incur a cost)

## Demo server

Try it here: [https://goohayee.fly.dev/](https://goohayee.fly.dev/)
