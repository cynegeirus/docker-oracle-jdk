# Oracle JDK Docker Image (Ubuntu Based)

This Docker image provides an isolated environment to run and test applications with a specific version of Oracle JDK. It supports Turkish localization and timezone settings, as well as basic development tools.

---

## 📦 Features

- ✅ Oracle JDK (via `.deb` installer)
- ✅ Ubuntu-based lightweight image
- ✅ Turkish locale (`tr_TR.UTF-8`) and `Europe/Istanbul` timezone
- ✅ Preinstalled CLI tools: `curl`, `wget`, `htop`, `nano`, `ca-certificates`
- ✅ Customizable via build arguments

---

## 🏗️ Build the Image

```bash
docker-compose build
````

Or with `docker build`:

```bash
docker build \
  --build-arg JDK_VERSION=21 \
  --build-arg TIMEZONE=Europe/Istanbul \
  --build-arg LOCALE=tr_TR.UTF-8 \
  -t oracle-jdk:21 .
```

---

## 🚀 Run the Container

```bash
docker-compose up -d
docker exec -it oracle-jdk bash
```

---

## 🛠 Build Arguments

| Argument      | Description                   | Default           |
| ------------- | ----------------------------- |-------------------|
| `JDK_VERSION` | JDK `.deb` version to install | `21`              |
| `TIMEZONE`    | Timezone to configure         | `Europe/Istanbul` |
| `LOCALE`      | Locale for language settings  | `tr_TR.UTF-8`     |

---

## License

This project is licensed under the [MIT License](LICENSE). See the license file for details.

---

## Issues, Feature Requests or Support

Please use the Issue > New Issue button to submit issues, feature requests or support issues directly to me. You can also send an e-mail to akin.bicer@outlook.com.tr.
