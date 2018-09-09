# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

# Create your views here.

from django.http import HttpResponse
from models import *
import  re
def  bugcount(request):
    #print request.method
    status=('打开','重新打开','修复','关闭','挂起')
    levels=('致命','严重','一般','警告','建议')
    statunames=('openbugs','reopenbugs','fixbugs','closebugs','guabugs','sumtrs')
    systems=('WIN7 32','WIN7 64','WINXP','WIN8 32','WIN8 64','WIN10 32','WIN10 64','Linux','Android')

    context={}
    for statuname in statunames:
        context[statuname] = [0, 0, 0, 0, 0,0]
    context['systems']=systems

    buglist = BugInfo.objects.all()
    projectset = set(i.project for i in buglist)
    context['projects']=projectset

    context['inputVersion'] = ''
    context['projectselected'] = ''
    context['systemselected'] = ''
    context['BugTotalValue']=0
    context['BugSeverity'] = '0.00%'
    context['BugSolutionRate'] = '0.00%'

    if(request.method == "POST"):
        proname=request.POST['project']
        sysname=request.POST['system']
        version=request.POST['version']
        context['projectselected'] = proname
        context['systemselected'] = sysname
        context['inputVersion'] = version
        print version

        if version == '':
            version ='^'
        else:
            try:
                re.compile(version)
            except:
                version = '^'
                context['inputVersion'] = 'InvalidInput Now use^'

        for i in range(len(status)):
            for j in range(len(levels)):
                context[statunames[i]][j]=BugInfo.objects.filter(project=proname, syst=sysname,stat=status[i],leve=levels[j],versio__iregex=version).count()
                context[statunames[i]][5]+=context[statunames[i]][j] #每一状态行的合计=该行每一级别的缺陷数相加
                context[statunames[5]][j]+= context[statunames[i]][j]
            context[statunames[5]][5] += context[statunames[i]][5]

        BugTotalValue=(context[statunames[5]][0]-context[statunames[4]][0])*3+(context[statunames[5]][1]-context[statunames[4]][1])*2+(context[statunames[5]][2]-context[statunames[4]][2])*1+(context[statunames[5]][3]-context[statunames[4]][3])*0.5
        context['BugTotalValue'] = BugTotalValue

        temp=(context[statunames[5]][5]-context[statunames[5]][4]-context[statunames[4]][5]+context[statunames[4]][4])

        if temp==0:
            context['BugSeverity'] = '0.00%'
            context['BugSolutionRate'] = '0.00%'
        else:
            BugSeverity = BugTotalValue/temp*100
            context['BugSeverity'] = '%.2f' % BugSeverity+'%'

         #temp=(context[statunames[5]][5]-context[statunames[5]][4]-context[statunames[4]][5]+context[statunames[4]][4])
            BugSolutionRate = (context[statunames[3]][5]-context[statunames[3]][4])/temp*100
            context['BugSolutionRate'] = '%.2f' % BugSolutionRate+'%'

        #print context

    return render(request,"bugcount.html",context)