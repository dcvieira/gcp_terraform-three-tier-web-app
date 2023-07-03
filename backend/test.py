# -*- coding: utf-8 -*-
from app import app
import unittest
import json

class Test(unittest.TestCase):
    def setUp(self):
        # cria uma instância do unittest, precisa do nome "setUp"
        self.app = app.test_client()

    def test_health_check(self):
        result = self.app.get('/health')

        # compara o status da requisicao (precisa ser igual a 200)
        self.assertEqual(result.status_code, 200)
        self.assertEqual(result.data.decode('utf-8'), "OK")

    def test_index(self):
        result = self.app.get('/')

        # compara o status da requisicao (precisa ser igual a 200)
        self.assertEqual(result.status_code, 200)
        json_result = json.loads(result.data.decode('utf8'))
        self.assertEqual(len(json_result), 20)