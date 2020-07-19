---
to: webpack.config.js
---
const path = require("path");
const webpack = require("webpack");
const slsw = require("serverless-webpack");
const { BundleAnalyzerPlugin } = require("webpack-bundle-analyzer");
const DuplicatePackageCheckerPlugin = require("duplicate-package-checker-webpack-plugin");

module.exports = {
  entry: slsw.lib.entries,
  mode: "production",
  devtool: slsw.lib.webpack.isLocal ? "source-map" : false,
  target: "node",
  stats: "minimal",
  module: {
    rules: [
      {
        test: /\.ts$/,
        include: [path.join(__dirname, "src")],
        use: "ts-loader",
      },
    ],
  },
  optimization: {
    noEmitOnErrors: true,
  },
  resolve: {
    extensions: [".js", ".ts", ".json"],
  },
  externals: {
    "aws-sdk": "aws-sdk",
  },
  plugins: [
    new BundleAnalyzerPlugin({
      analyzerMode: process.env.ANALYZE ? "static" : "disabled",
      generateStatsFile: false,
      statsOptions: { source: true },
    }),
    new DuplicatePackageCheckerPlugin({
      verbose: true,
      emitError: true,
      exclude(instance) {
        // will be resolved in winston-transport 4.4.1
        // https://github.com/winstonjs/winston-transport/pull/45
        return (
          (instance.name === "readable-stream" &&
            instance.version === "2.3.7" &&
            instance.path.includes("winston-transport")) ||
          instance.issuer.includes("winston-transport/~/readable-stream")
        );
      },
    }),
    new webpack.DefinePlugin({
      "process.env.NODE_ENV": slsw.lib.webpack.isLocal
        ? JSON.stringify("development")
        : JSON.stringify("production"),
    }),
  ],
};
