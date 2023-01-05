'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "f72cbf98aa85459a373b1fc49ce9e971",
"assets/assets/bg.jpg": "9add6610748b5f1fc5e3f40aafa6733f",
"assets/assets/bgb.jpg": "1130a18b9e1abe5d35b60ac8408ebcef",
"assets/assets/bg_honeycomb.jpg": "490879a0d027d7fa831e50e5f77d8df2",
"assets/assets/bg_honeycomb_b.jpg": "f60edb1b1b6f4d2432b284a95fc53fe1",
"assets/assets/blender/videos/opener.mp4": "c23d40b6590514774c77287910f3ca64",
"assets/assets/companies_images/bb.jpg": "2b2ce76b50d822a9ede167d646de7a80",
"assets/assets/companies_images/evosoft.jpg": "dfd4bbacb14cd1da899bc3667ac55acb",
"assets/assets/companies_images/mentor.jpg": "5a3c3b0dae34299f258a01b8a04696a7",
"assets/assets/companies_images/mza.jpg": "bf9eb3c42ee34875ab9e2a89267d6eea",
"assets/assets/companies_images/mzx.png": "ec890639c152ada8912dd7dfdd615f6d",
"assets/assets/companies_images/vendo.png": "80d8346d8d4bc7387f190309ca4e7c42",
"assets/assets/jsons/basedata_en.json": "de647bb0acb9039c55e45f7e144f85eb",
"assets/assets/jsons/basedata_hu.json": "ce01a20b386564ddf4f62b277da5fbb2",
"assets/assets/jsons/jobs_en.json": "5908ec7f6052f9905fe21a87a952d7a5",
"assets/assets/jsons/jobs_hu.json": "50f4773cca927137a9c84cd7c16adb47",
"assets/assets/jsons/web_links.json": "f9be03e08393815f93bc5a5b6cc539fe",
"assets/assets/masterfield.jpg": "5a9e96d83a6ae38fb30ad996dd8ac7b4",
"assets/assets/me.jpg": "0d0e6083c0542a00731d57917a1232c9",
"assets/assets/my_images/logo_NT_big.png": "c6e13f0989731e843d964ddcddf5e354",
"assets/assets/my_images/logo_NT_big.xcf": "9644c58520cebc84e4381f4bffe18c5d",
"assets/assets/my_images/logo_NT_big_2.png": "57865a404f54dace34545dee6c2bd41e",
"assets/assets/my_images/logo_NT_big_2.xcf": "c7998ece33c5798cd82aacad96b93a3f",
"assets/assets/pdf/cv.pdf": "c6e8acbdb89903e0ceb04d65e638bd11",
"assets/assets/ref_medias/images/cruzr_1.jpg": "0f524bc8915a652a98f0b2bcec50bcd5",
"assets/assets/ref_medias/images/cruzr_2.jpg": "02181517a48da174932793dfee3be7c0",
"assets/assets/ref_medias/images/cruzr_3.jpg": "fa1dc730a7e49b30db5329756cd2f913",
"assets/assets/ref_medias/images/cruzr_4.jpg": "da40c5a8ce68b19ceebf197f7e1fc116",
"assets/assets/ref_medias/images/cruzr_5.jpg": "35b826e470c49cda3bad718b0e0b70ca",
"assets/assets/ref_medias/images/cruzr_6.jpg": "b058ccd1bd6b6d7895d958cf447b5bbf",
"assets/assets/ref_medias/images/diverzum_input_3.png": "f84ac9c7d509fef3efe6ed0419eb3a32",
"assets/assets/ref_medias/images/diverzum_list_2.png": "e3f9c21296bde2e71371cd6d6096dc37",
"assets/assets/ref_medias/images/diverzum_login_1.png": "14d5fc4b183815367bbbd2d075637b0c",
"assets/assets/ref_medias/images/ff_recipes_1.png": "80f80ef5e8869cf8e689ce19f1614c91",
"assets/assets/ref_medias/images/ff_recipes_2.png": "08eb2dd5d8051f9cc4fab646bc350d59",
"assets/assets/ref_medias/images/ff_recipes_3.png": "38796cd12e2dd395d53d36ba22045a26",
"assets/assets/ref_medias/images/ff_recipes_4.png": "a296526a04b6ecfe1b9f4d71ca2a866d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "6910071251851cb77567d3e4ce3fb6e2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "ed0eb705c9472aca01172140540da9da",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3e9b545902b1c30985847c44351fdf2c",
"/": "3e9b545902b1c30985847c44351fdf2c",
"main.dart.js": "0bd6552fa18c187cc2e0c1dd0186c50f",
"manifest.json": "8a4fe73f6de4d4c2a4d188a032b7de5d",
"version.json": "493e3dd114bc38996027421d9aad5409"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
