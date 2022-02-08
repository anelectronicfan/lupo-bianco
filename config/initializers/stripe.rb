Rails.configuration.stripe = {
    :publishable_key => 'pk_test_51KQSO2IV2kAfCmoXzYB9YPu8BDlcKDdVfAupjvtvhlNWkmoqMFdmErcjMA4DWvvlv7kAOh5LsEMDXMRWml2QICaY004IpkVkRu',
    :secret_key => 'sk_test_51KQSO2IV2kAfCmoXh89sRd3swMzTlT2gDnz6d8STCiUzxS88g4EPo0vSptYXDFiLgggC1ZnKRYFHyBRRT8H3TZB800LYhScNnD'
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]