from django.contrib import admin
from .models import PageIds


class BaseAdmin(admin.ModelAdmin):
    exclude = ["is_publish", "sortable"]


class PageIdsAdmin(BaseAdmin):
    pass


admin.site.register(PageIds, PageIdsAdmin)
