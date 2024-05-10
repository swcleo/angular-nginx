# angular-nginx

常忘記 angular 如果使用 base-href 設定後，要如何在 nginx 上配置 location，使用這個專案記錄一下。

## mkcert

使用 mkcert 工具生成 SSL/TLS 證書的簡單步驟

產生根金鑰

```sh
mkcert -install
```

指定域名

```sh
mkcert -cert-file nginx.crt -key-file nginx.key example.local localhost 127.0.0.1 ::1
```

## OpenResty

研究 OpenResty 基於 Nginx 的 Web 平台，可以使用 lua 開發應用服務。例如：如果需要動態設定CDN網址，可以透過 lua 處理 index.html 的內容。

## Angular

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 17.3.6.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
