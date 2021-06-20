import logging
from django.shortcuts import render 
from django.conf import settings

logger = logging.getLogger('StackDriverHandler')

class ExceptionMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        if response.status_code == 500:
            return render(request, "404.html")
            
        if response.status_code == 404:
            return render(request, "404.html")
        
        if response.status_code == 403:
            return render(request, "404.html")
            
        return response

    def process_exception(self, request, exception):
        try:
            logger.info(request,extra=exception)
        except Exception as e:
            logger.error(exception)
        return None
