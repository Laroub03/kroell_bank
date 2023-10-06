'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1339e9920f0050dbedbfaac224d7be8d",
"assets/AssetManifest.json": "38e6cb6e61ee2640bb69c8a513e406f4",
"assets/assets/fluttertest+4-client-key.pem": "5c2d156157c52d24756f95bf2ca9826e",
"assets/assets/fluttertest+4-client.pem": "7c25b3566f29d866f5b9ce7cf7d6b630",
"assets/assets/rootCA.pem": "e927af5379790ea6232c64e05f9defdf",
"assets/FontManifest.json": "6410a9cee6e4224422b5b5b0ada200f5",
"assets/fonts/andina.ttf": "2349c4ffb7293b5f88e8538ec577a8d4",
"assets/fonts/googlesansebold.ttf": "4457817ac2b9993c65e81aa05828fe9c",
"assets/fonts/googlesansmedium.ttf": "8d57e4014b18edef070d285746485115",
"assets/fonts/googlesansregular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/images/banking/Banking_ic_apple.png": "63c28b851393924a9c059380578933c4",
"assets/images/banking/Banking_ic_Call.png": "614c2b87cf01f948458d3a7a44736af9",
"assets/images/banking/Banking_ic_Can.png": "d5cd547cf6d9e8f172a41c51580f4cd7",
"assets/images/banking/Banking_ic_cardimage.png": "fabe036c8860fe2269447efedb0cd240",
"assets/images/banking/Banking_ic_Chart.png": "bf4df6fd870c83592961453ea0b48f77",
"assets/images/banking/Banking_ic_Clock.png": "9ad9c7cb6149c7f12f22016610111bf3",
"assets/images/banking/Banking_ic_CNY.jpg": "1af670a49669c4180ff60f986b418fff",
"assets/images/banking/Banking_ic_Eletronics.png": "e34b229e3adef2ad6f807cf661dfb719",
"assets/images/banking/Banking_ic_Euro.png": "50d3d7ae37d9014b42c30aa032441625",
"assets/images/banking/Banking_ic_facebook.png": "a4b0a234d5b0ce5c87b8f16a34e3ca10",
"assets/images/banking/banking_ic_face_id.png": "c1dce1bbc9266a7311003bb0ff449ef4",
"assets/images/banking/Banking_ic_History.png": "36b0d5974471e2f93208e790ce116af0",
"assets/images/banking/Banking_ic_Home.svg": "87d51c56a463f3aa3f63024c7b877377",
"assets/images/banking/Banking_ic_Hotal.png": "84ffd36d475119305f35042c513425bb",
"assets/images/banking/Banking_ic_Inst.png": "5c570427ee23f69853d28aec805eee79",
"assets/images/banking/Banking_ic_Logout.png": "2d8e9579ba8f62fb2d3d81a1caea5155",
"assets/images/banking/Banking_ic_MasterCard.png": "baf50bc20dc406be868dcad4781a87eb",
"assets/images/banking/Banking_ic_Menu.svg": "a450cc103b020589bf97577c53c009d7",
"assets/images/banking/Banking_ic_messenger.png": "167e8d3307f74d30c42e58656639d1ea",
"assets/images/banking/Banking_ic_Moblie.png": "fdff4e7fad16d63a39ae1044b94040da",
"assets/images/banking/Banking_ic_News.png": "b57e97af97b5649f3ce5b9be1a7ea894",
"assets/images/banking/Banking_ic_Payment.svg": "e4792c8981260e11cac3f81f245d7f82",
"assets/images/banking/Banking_ic_paypal.png": "23b36772e139cc06e25ba6d1a17ebad4",
"assets/images/banking/Banking_ic_piggybank.png": "7dd7cc3c2fb3f3664802c14a5f56be3a",
"assets/images/banking/Banking_ic_Pin.png": "abfba8bef89617dfb0be83b638ae6cd2",
"assets/images/banking/Banking_ic_plane.png": "4fa8e8752f60570583e36321882f5605",
"assets/images/banking/Banking_ic_PlayStore.png": "b2eebc0dbf8ea42c3b3c4065d8e1ff67",
"assets/images/banking/Banking_ic_QR.png": "fbd338e8ceb89bd57425b075b260c05a",
"assets/images/banking/Banking_ic_Ques.png": "7f9e8dc8bf7d741fec7ea4a0359e179a",
"assets/images/banking/Banking_ic_Question.png": "f000dec51b286f3f24081c11ce65b138",
"assets/images/banking/Banking_ic_Rup.jpg": "707377942e85a1575002d800a833cd25",
"assets/images/banking/Banking_ic_Saving.svg": "74fafad3e1c53990b307be1e0f71f7fc",
"assets/images/banking/Banking_ic_security.png": "e7dda764e745d29f1e453e0af8893e77",
"assets/images/banking/Banking_ic_Setting.png": "d697e7620de09cbf02184b359f694079",
"assets/images/banking/Banking_ic_Share.png": "857760c2fc681aa8c887b15d45c3d914",
"assets/images/banking/Banking_ic_ShoppingCart.png": "a3ceb65e90357193d7ac1da0ebce600b",
"assets/images/banking/Banking_ic_Skype.png": "2d0e9921e3a320456f938756d0af3fb0",
"assets/images/banking/Banking_ic_TC.png": "93438571b8ed1b0cff6cb2e81783c514",
"assets/images/banking/Banking_ic_Train.png": "f95af02939a1b9815062347c4a3049c6",
"assets/images/banking/Banking_ic_Transfer.svg": "3b9907860a0a55c20a5b37406a85d561",
"assets/images/banking/Banking_ic_USD.png": "6da9247153626272d54fea4abb62a95c",
"assets/images/banking/Banking_ic_user1.jpeg": "ed3a84fc5308e9ff9a92faad7791be40",
"assets/images/banking/Banking_ic_user2.jpg": "8bdad9f59c17e405050e6f794ffda5e6",
"assets/images/banking/Banking_ic_Voice.png": "13038a3f06e2919dea1f1693029f227d",
"assets/images/banking/Banking_ic_walk1.png": "fefa8c9908a08b6cce9db06ee654de72",
"assets/images/banking/Banking_ic_walk2.png": "213d7b178cc2e359257e5818fd196ddf",
"assets/images/banking/Banking_ic_walk3.png": "485d0d4ba2a5ed038a1041ecc79a3b84",
"assets/images/banking/Banking_ic_Wallet.png": "87e4e30bef5e37b29f169be051de5556",
"assets/images/banking/Banking_ic_WaterDrop.png": "7b5f12cd50a562d0e275af7cb5f19a3c",
"assets/images/banking/Banking_ic_Website.png": "43170e018679ce8f3acefbf258cefb33",
"assets/images/banking/Banking_ic_Whatsup.png": "774352deeaa60ebe04164a1e28489771",
"assets/images/banking/Banking_ic_Yen.png": "36fdf838016261f885774c913e48e0f6",
"assets/images/banking/Bankinh_ic_Ticket.png": "b22d57e5a4eac0a5f909295d2fbcb084",
"assets/NOTICES": "e7da500b27f12009bcfaf03e61d6ab5c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/nb_utils/fonts/LineAwesome.ttf": "bcc78af7963d22efd760444145073cd3",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a7c32225a629af732343631af4d9eb45",
"/": "a7c32225a629af732343631af4d9eb45",
"main.dart.js": "f26743a64ddfac6f1960bff9ffe20a16",
"manifest.json": "abb054aa1fa860224dea19ae910b3117",
"version.json": "23bcf22405e06f355397d39b9f1a5d5b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
