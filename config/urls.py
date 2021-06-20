from cms.sitemaps import CMSSitemap
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.urls import include, path

admin.autodiscover()

# sitemap configuration
# CMSSitemap.changefreq = "weekly"
# CMSSitemap.priority = 1.0

urlpatterns = [
    path("sitemap.xml", sitemap, {"sitemaps": {"cmspages": CMSSitemap}}),
    path("ckeditor/", include("ckeditor_uploader.urls")),
]


# # for set the prefix en/ and other locals.
# from django.conf.urls.i18n import i18n_patterns
# urlpatterns += i18n_patterns(
#     path("admin/", admin.site.urls),
#     path("", include("cms.urls")),
# )


urlpatterns += [
    path("admin/", admin.site.urls),
    path("", include("cms.urls")),
]


# This is only needed when using runserver.
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
