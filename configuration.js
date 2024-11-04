module.exports = async (require) => {
  const path = require("path");
  const express = require("express");
  const AutoEncrypt = require("@small-tech/auto-encrypt");
  const killTheNewsletter = require(".").default;

  const { webApplication, emailApplication } = killTheNewsletter(
    path.join(__dirname, "data")
  );

  webApplication.set("url", "https://newsletter.rodeo");
  webApplication.set("email", "smtp://newsletter.rodeo");
  webApplication.set("administrator", "mailto:kill-the-newsletter@semiformal.net");

webApplication.listen(8080);

  emailApplication.listen(2525, () => {
    console.log("Email server started");
  });
};
