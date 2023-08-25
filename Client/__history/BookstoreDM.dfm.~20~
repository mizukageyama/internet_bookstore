object BookstoreDataModule: TBookstoreDataModule
  Height = 333
  Width = 473
  object fdMemBook: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 70
    Top = 96
    object fdMemBookId: TIntegerField
      FieldName = 'Id'
    end
    object fdMemBookTitle: TStringField
      FieldName = 'Title'
      Size = 255
    end
    object fdMemBookSynopsis: TStringField
      FieldName = 'Synopsis'
      Size = 255
    end
  end
  object dsBook: TDataSource
    DataSet = fdMemBook
    Left = 70
    Top = 173
  end
  object fdMemCustomer: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 179
    Top = 96
  end
  object dsCustomer: TDataSource
    DataSet = fdMemCustomer
    Left = 179
    Top = 173
  end
  object fdMemCustomerReview: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 320
    Top = 96
    object fdMemCustomerReviewId: TIntegerField
      FieldName = 'Id'
    end
    object fdMemCustomerReviewBookId: TIntegerField
      DisplayLabel = 'Book Id'
      FieldName = 'BookId'
    end
    object fdMemCustomerReviewCustomerId: TIntegerField
      DisplayLabel = 'Customer Id'
      FieldName = 'CustomerId'
    end
    object fdMemCustomerReviewRating: TIntegerField
      FieldName = 'Rating'
    end
    object fdMemCustomerReviewReview: TStringField
      FieldName = 'Review'
      Size = 255
    end
  end
  object dsCustomerReview: TDataSource
    DataSet = fdMemCustomerReview
    Left = 320
    Top = 173
  end
end
