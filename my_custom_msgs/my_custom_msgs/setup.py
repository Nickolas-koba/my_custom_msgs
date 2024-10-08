from setuptools import setup

package_name = 'my_custom_msgs'

setup(
    name=package_name,
    version='0.1.0',
    packages=[],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='newans',
    maintainer_email='josh.newans@gmail.com',
    description='Pacote de mensagens customizadas para rastreamento de bolas.',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [],
        
    },
)
