from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.template.defaultfilters import escape
from django.utils.safestring import mark_safe
from django.urls import path, reverse
from rangefilter.filter import DateRangeFilter, DateTimeRangeFilter

from advanced_filters.admin import AdminAdvancedFiltersMixin

from .models import Brand, Drive, DriveSale

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
  fields = ['name']
  search_fields = (
    'name',
  )

@admin.register(Drive)
class DriveAdmin(admin.ModelAdmin):
  list_display = (
    'brand', 'disk_type', 'capacity', 'size', 'interface_type',
  )
  list_filter = (
    'brand', 'disk_type', 'capacity', 'size', 'interface_type',
  )
  list_select_related = [
    'brand',
  ]
  search_fields = (
    'brand__name', 'disk_type', 'capacity', 'size', 'interface_type',
  )
  autocomplete_fields = ('brand',)

@admin.register(DriveSale)
class DriveSaleAdmin(AdminAdvancedFiltersMixin, admin.ModelAdmin):
  list_display = (
    'date', 'brand_link', 'disk_type', 'capacity', 'size', 'interface_type',
  )
  list_filter = (
    'drive__brand', 'drive__disk_type', 'drive__capacity', 'drive__size',
    'drive__interface_type', ('date', DateTimeRangeFilter),
  )
  search_fields = (
    'drive__brand', 'drive__disk_type', 'drive__capacity', 'drive__size',
    'drive__interface_type', 'date',
  )
  list_select_related = [
    'drive', 'drive__brand',
  ]
  autocomplete_fields = ('drive',)

  advanced_filter_fields = (
    'drive__brand', 'drive__disk_type', 'drive__capacity', 'drive__size',
    'drive__interface_type', 'date',
  )

  def brand_link(self, obj=None):
      if obj:
          return mark_safe('<a href="%s">%s</a>' % (reverse("admin:diskreportapp_brand_change", args=(obj.drive.brand_id,)), escape(obj.drive.brand.name)))
      else: return '-'
  brand_link.short_description = _("brand")
  brand_link.admin_order_field = 'drive__brand__name'

  def disk_type(self, obj=None):
    return obj.drive.get_disk_type_display()
  disk_type.short_description = _("disk type")
  disk_type.admin_order_field = 'drive__disk_type'

  def capacity(self, obj=None):
    return str(obj.drive.capacity) + " GB"
  capacity.short_description = _("capacity")
  capacity.admin_order_field = 'drive__capacity'

  def size(self, obj=None):
    return str(obj.drive.size) + "\""
  size.short_description = _("size")
  size.admin_order_field = 'drive__size'

  def interface_type(self, obj=None):
    return obj.drive.get_interface_type_display()
  interface_type.short_description = _("interface type")
  interface_type.admin_order_field = 'drive__interface_type'
