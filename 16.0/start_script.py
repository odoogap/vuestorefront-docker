#!/bin/python
import os


env['ir.config_parameter'].set_param('web.base.url', 'http://localhost:8069')
env['ir.config_parameter'].set_param('web.base.url.freeze', 'True')
env['ir.config_parameter'].set_param('vsf_cache_invalidation_url', 'http://vsf:3000/cache-invalidate')
env['ir.config_parameter'].set_param('vsf_cache_invalidation_key', os.getenv('INVALIDATION_KEY'))
env['ir.config_parameter'].set_param('vsf_debug_mode', True)

env.cr.commit()
