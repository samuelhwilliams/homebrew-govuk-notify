class GovukNotifyCli < Formula
  desc "CLI for common commands used by GOV.UK Notify developers"
  homepage "https://github.com/samuelhwilliams/govuk-notify-cli"
  url "git@github.com:samuelhwilliams/govuk-notify-cli.git",
      using:    :git,
      tag:      "v0.3.0",
      revision: "2b523b3a9546e75d1a219c60d60e97209e95a51f"
  head "git@github.com:samuelhwilliams/govuk-notify-cli.git",
      using:  :git,
      branch: "main"

  depends_on "rust" => :build
  depends_on "alphagov/gds/gds-cli"
  depends_on "cloudfoundry/tap/cf-cli@7"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def post_install
    ohai "Session Manager Plugin Cask required"
    puts ""
    puts "--- WARNING: Additional dependencies required ---"
    puts ""
    puts "To use the GDS CLI, you must have aws-vault installed."
    puts "If `aws-vault` is not available, run 'brew install --cask aws-vault'."
    puts ""
    puts "To use the GOV.UK Notify CLI, you must install the Session Manager Plugin cask."
    puts "If `session-manager-plugin` is not available, run 'brew install --cask session-manager-plugin'."
    puts ""
    puts "--- WARNING: Additional dependencies required ---"
    puts ""
  end

  test do
    assert_match("Usage", shell_output("#{bin}/notify"))
  end
end
