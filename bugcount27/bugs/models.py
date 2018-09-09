# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class BugInfo(models.Model):
    stat=models.CharField(max_length=30)
    leve=models.CharField(max_length=30)
    syst=models.CharField(max_length=30)
    versio = models.CharField(max_length=30)
    project = models.CharField(max_length=50)
    def __unicode__(self):  # 在Python3中用 __str__ 代替 __unicode__
        return self.project+' BugID:'+str(self.id)