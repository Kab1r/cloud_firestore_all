# Cross-Platform Cloud Firestore Plugin

A Firebase Firestore wrapper for Flutter that wraps [cloud_firestore](https://pub.dev/packages/cloud_firestore) and [firebase](https://pub.dev/packages/firebase) into a single API for use on both Flutter web and mobile.

## Setup

### Mobile

Follow [cloud_firestore](https://pub.dev/packages/cloud_firestore) setup instructions for mobile setup.

### Web

Add Firebase JavaScript libraries to html file and initialize your application with your variables.

```html
<script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-firestore.js"></script>
<script>
    firebase.initializeApp({
        apiKey: "API KEY",
        authDomain: "AUTH DOMAIN",
        databaseURL: "DATABASE URL",
        projectId: "PROJECT ID",
        storageBucket: "STORAGE BUCKER URL",
        appId: "APP ID",
        messagingSenderId: "sender-id",
        measurementId: "G-measurement-id"
    });
</script>
```

See Example for details

## TODO

- [ ] Add Unit Testing
- [ ] Test Compatibility