---
to: webpack.config.js
---
/* eslint-disable @typescript-eslint/no-var-requires */

const path = require("path");
const webpack = require("webpack");
const slsw = require("serverless-webpack");
const { BundleAnalyzerPlugin } = require("webpack-bundle-analyzer");

module.exports = {
  entry: slsw.lib.entries,
  mode: "production",
  devtool: slsw.lib.webpack.isLocal ? "source-map" : false,
  target: "node",
  stats: "errors-only",
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
    new webpack.DefinePlugin({
      "process.env.NODE_ENV": slsw.lib.webpack.isLocal
        ? JSON.stringify("development")
        : JSON.stringify("production"),
    }),
  ],
};
