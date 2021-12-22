from django.db import models
from django.utils.text import format_lazy
from django.utils.translation import ugettext_lazy as _

class Brand(models.Model):
  name = models.CharField(
    verbose_name=_('name'),
    max_length=128,
    unique=True,
  )

  def __str__(self, test = None):
    return self.name

  class Meta:
    verbose_name = _('Brand object')
    verbose_name_plural = _('brands')
    ordering = ['name']


class Drive(models.Model):
  TYPE_CHOICES = [
    (0, _('SSD')),
    (1, _('HDD')),
  ]

  INTERFACE_TYPE_CHOICES = [
    (0, _('Other')),
    (1, _('USB')),
    (2, _('SCSI')),
    (3, _('SAS')),
    (4, _('IDE')),
  ]

  brand = models.ForeignKey(
    'Brand',
    on_delete=models.PROTECT,
    verbose_name=_('brand'),
  )

  disk_type = models.PositiveSmallIntegerField(
    verbose_name=_('type'),
    choices=TYPE_CHOICES,
  )

  capacity = models.PositiveSmallIntegerField(
    verbose_name=_('capacity'),
  )

  size = models.PositiveSmallIntegerField(
    verbose_name=_('size'),
  )

  interface_type = models.PositiveSmallIntegerField(
    verbose_name=_('interface type'),
    choices=INTERFACE_TYPE_CHOICES,
    default=0,
  )


  def __str__(self, test = None):
    bn = str(self.brand.name)
    tp = str(self.TYPE_CHOICES[self.disk_type][1])
    cp = str(self.capacity)
    sz = str(self.size)
    it = str(self.INTERFACE_TYPE_CHOICES[self.interface_type][1])
    return bn + " " + tp + " " + cp + " GB " + sz + "\" " + it

  class Meta:
    verbose_name = _('Drive object')
    verbose_name_plural = _('drives')
    ordering = ['brand', 'disk_type', 'capacity', 'size', 'interface_type']

class DriveSale(models.Model):
  drive = models.ForeignKey(
    'Drive',
    on_delete=models.PROTECT,
    verbose_name=_('drive'),
  )

  date = models.DateTimeField(
    verbose_name=_('sale date'),
  )


  def __str__(self, test = None):
    return str(self.drive) + " " + str(self.date)

  class Meta:
    verbose_name = _('Drive sale object')
    verbose_name_plural = _('drive sales')
    ordering = ['drive', 'date']
