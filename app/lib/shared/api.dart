import "package:dio/dio.dart";


Dio api = Dio(
  BaseOptions(
    baseUrl: 'https://aipub-backend-git-test-victorgrodriguesm7s-projects.vercel.app/api',
    headers: {
      "content-type": "application/json",
      "accept": "application/json"
    },
  )
);
