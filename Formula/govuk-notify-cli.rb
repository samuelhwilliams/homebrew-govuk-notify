class GovukNotifyCli < Formula
  desc "CLI for common commands used by GOV.UK Notify developers"
  homepage "https://github.com/samuelhwilliams/govuk-notify-cli"
  url "git@github.com:samuelhwilliams/govuk-notify-cli.git",
      using:    :git,
      tag:      "v0.2.0",
      revision: "52e46cc86525f18a24194c3dc1df7e6225202125"
  head "git@github.com:samuelhwilliams/govuk-notify-cli.git",
      using:  :git,
      branch: "main"

  depends_on "rust" => :build
  depends_on "alphagov/gds/gds-cli"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match("Usage", shell_output("#{bin}/notify"))
  end
end
