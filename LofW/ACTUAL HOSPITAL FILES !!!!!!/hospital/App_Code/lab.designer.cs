﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18449
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="lynaddis")]
public partial class labDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertlab(lab instance);
  partial void Updatelab(lab instance);
  partial void Deletelab(lab instance);
  #endregion
	
	public labDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["lynaddisConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public labDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public labDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public labDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public labDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<lab> labs
	{
		get
		{
			return this.GetTable<lab>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.lab")]
public partial class lab : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _patientID;
	
	private string _patientCode;
	
	private string _DateofBirth;
	
	private string _age;
	
	private string _sex;
	
	private string _testType;
	
	private string _testCode;
	
	private string _resultType1;
	
	private string _resultType2;
	
	private string _resultdescription;
	
	private string _abnormal;
	
	private string _referenceRange;
	
	private string _units;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnpatientIDChanging(string value);
    partial void OnpatientIDChanged();
    partial void OnpatientCodeChanging(string value);
    partial void OnpatientCodeChanged();
    partial void OnDateofBirthChanging(string value);
    partial void OnDateofBirthChanged();
    partial void OnageChanging(string value);
    partial void OnageChanged();
    partial void OnsexChanging(string value);
    partial void OnsexChanged();
    partial void OntestTypeChanging(string value);
    partial void OntestTypeChanged();
    partial void OntestCodeChanging(string value);
    partial void OntestCodeChanged();
    partial void OnresultType1Changing(string value);
    partial void OnresultType1Changed();
    partial void OnresultType2Changing(string value);
    partial void OnresultType2Changed();
    partial void OnresultdescriptionChanging(string value);
    partial void OnresultdescriptionChanged();
    partial void OnabnormalChanging(string value);
    partial void OnabnormalChanged();
    partial void OnreferenceRangeChanging(string value);
    partial void OnreferenceRangeChanged();
    partial void OnunitsChanging(string value);
    partial void OnunitsChanged();
    #endregion
	
	public lab()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Id
	{
		get
		{
			return this._Id;
		}
		set
		{
			if ((this._Id != value))
			{
				this.OnIdChanging(value);
				this.SendPropertyChanging();
				this._Id = value;
				this.SendPropertyChanged("Id");
				this.OnIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_patientID", DbType="VarChar(20)")]
	public string patientID
	{
		get
		{
			return this._patientID;
		}
		set
		{
			if ((this._patientID != value))
			{
				this.OnpatientIDChanging(value);
				this.SendPropertyChanging();
				this._patientID = value;
				this.SendPropertyChanged("patientID");
				this.OnpatientIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_patientCode", DbType="VarChar(20)")]
	public string patientCode
	{
		get
		{
			return this._patientCode;
		}
		set
		{
			if ((this._patientCode != value))
			{
				this.OnpatientCodeChanging(value);
				this.SendPropertyChanging();
				this._patientCode = value;
				this.SendPropertyChanged("patientCode");
				this.OnpatientCodeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateofBirth", DbType="VarChar(15)")]
	public string DateofBirth
	{
		get
		{
			return this._DateofBirth;
		}
		set
		{
			if ((this._DateofBirth != value))
			{
				this.OnDateofBirthChanging(value);
				this.SendPropertyChanging();
				this._DateofBirth = value;
				this.SendPropertyChanged("DateofBirth");
				this.OnDateofBirthChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_age", DbType="VarChar(3)")]
	public string age
	{
		get
		{
			return this._age;
		}
		set
		{
			if ((this._age != value))
			{
				this.OnageChanging(value);
				this.SendPropertyChanging();
				this._age = value;
				this.SendPropertyChanged("age");
				this.OnageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_sex", DbType="VarChar(10)")]
	public string sex
	{
		get
		{
			return this._sex;
		}
		set
		{
			if ((this._sex != value))
			{
				this.OnsexChanging(value);
				this.SendPropertyChanging();
				this._sex = value;
				this.SendPropertyChanged("sex");
				this.OnsexChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_testType", DbType="VarChar(MAX)")]
	public string testType
	{
		get
		{
			return this._testType;
		}
		set
		{
			if ((this._testType != value))
			{
				this.OntestTypeChanging(value);
				this.SendPropertyChanging();
				this._testType = value;
				this.SendPropertyChanged("testType");
				this.OntestTypeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_testCode", DbType="VarChar(20)")]
	public string testCode
	{
		get
		{
			return this._testCode;
		}
		set
		{
			if ((this._testCode != value))
			{
				this.OntestCodeChanging(value);
				this.SendPropertyChanging();
				this._testCode = value;
				this.SendPropertyChanged("testCode");
				this.OntestCodeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resultType1", DbType="VarChar(MAX)")]
	public string resultType1
	{
		get
		{
			return this._resultType1;
		}
		set
		{
			if ((this._resultType1 != value))
			{
				this.OnresultType1Changing(value);
				this.SendPropertyChanging();
				this._resultType1 = value;
				this.SendPropertyChanged("resultType1");
				this.OnresultType1Changed();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resultType2", DbType="VarChar(MAX)")]
	public string resultType2
	{
		get
		{
			return this._resultType2;
		}
		set
		{
			if ((this._resultType2 != value))
			{
				this.OnresultType2Changing(value);
				this.SendPropertyChanging();
				this._resultType2 = value;
				this.SendPropertyChanged("resultType2");
				this.OnresultType2Changed();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_resultdescription", DbType="VarChar(MAX)")]
	public string resultdescription
	{
		get
		{
			return this._resultdescription;
		}
		set
		{
			if ((this._resultdescription != value))
			{
				this.OnresultdescriptionChanging(value);
				this.SendPropertyChanging();
				this._resultdescription = value;
				this.SendPropertyChanged("resultdescription");
				this.OnresultdescriptionChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_abnormal", DbType="VarChar(50)")]
	public string abnormal
	{
		get
		{
			return this._abnormal;
		}
		set
		{
			if ((this._abnormal != value))
			{
				this.OnabnormalChanging(value);
				this.SendPropertyChanging();
				this._abnormal = value;
				this.SendPropertyChanged("abnormal");
				this.OnabnormalChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_referenceRange", DbType="VarChar(MAX)")]
	public string referenceRange
	{
		get
		{
			return this._referenceRange;
		}
		set
		{
			if ((this._referenceRange != value))
			{
				this.OnreferenceRangeChanging(value);
				this.SendPropertyChanging();
				this._referenceRange = value;
				this.SendPropertyChanged("referenceRange");
				this.OnreferenceRangeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_units", DbType="VarChar(50)")]
	public string units
	{
		get
		{
			return this._units;
		}
		set
		{
			if ((this._units != value))
			{
				this.OnunitsChanging(value);
				this.SendPropertyChanging();
				this._units = value;
				this.SendPropertyChanged("units");
				this.OnunitsChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591