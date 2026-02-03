from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls), # Admin sirf yahan rahega
    path('', include('sarees_user.urls')),
]
# Apne existing urlpatterns ke niche ye plus (+) kar dena
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)