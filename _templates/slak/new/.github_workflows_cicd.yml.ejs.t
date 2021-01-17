---
to: .github/workflows/cicd.yml
---
name: "CI/CD"
on:
  - push
jobs:
  lint-test:
    name: "Lint/Test"
    runs-on: ubuntu-latest
    if: "!contains(github.event.head_commit.message, 'skip ci')"
    steps:
      - uses: actions/setup-node@v1
        with:
          node-version: "12.13"
      - name: "Checkout"
        uses: actions/checkout@master
      - name: Cache node_modules
        id: cache
        uses: actions/cache@v1
        with:
          path: node_modules
          key: ${{ runner.os }}-${{ hashFiles('yarn.lock') }}
      - name: Install
        if: steps.cache.outputs.cache-hit != 'true'
        run: yarn install --frozen-lockfile --ignore-scripts
      - name: Lint
        run: yarn lint
      - name: Test
        run: yarn test
      - name: Build
        run: yarn sls webpack
        env:
          NODE_ENV: production
  deploy:
    name: "Deploy"
    runs-on: ubuntu-latest
    needs: lint-test
    if: github.ref == 'refs/heads/master'
    steps:
      - uses: actions/setup-node@v1
        with:
          node-version: "12.13"
      - name: "Checkout"
        uses: actions/checkout@master
      - name: Cache node_modules
        id: cache
        uses: actions/cache@v1
        with:
          path: node_modules
          key: ${{ runner.os }}-${{ hashFiles('yarn.lock') }}
      - name: Install
        if: steps.cache.outputs.cache-hit != 'true'
        run: yarn install --frozen-lockfile --ignore-scripts
      - name: Set region
        run: echo "region=$(yarn --silent sls print --format text --path provider.region) >> $GITHUB_ENV"
      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.region }}
      - name: Deploy (dev)
        run: yarn sls deploy
