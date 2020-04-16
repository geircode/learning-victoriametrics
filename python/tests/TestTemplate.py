import unittest
import datetime

class TestTemplate(unittest.TestCase):

    @classmethod
    def setUpClass(self):
        pass 
        
    def setUp(self):
        print(datetime.datetime.now())   

    def test_template(self):
        pass

if __name__ == '__main__':
    unittest.main()
