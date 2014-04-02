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



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_66430_navpreet")]
public partial class contactusClassesDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertcontactus(contactus instance);
  partial void Updatecontactus(contactus instance);
  partial void Deletecontactus(contactus instance);
  #endregion
	
	public contactusClassesDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DB_66430_navpreetConnectionString1"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public contactusClassesDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactusClassesDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactusClassesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactusClassesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<contactus> contactus
	{
		get
		{
			return this.GetTable<contactus>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.contactus")]
public partial class contactus : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _firstname;
	
	private string _lastname;
	
	private int _telephone;
	
	private string _email;
	
	private string _subject;
	
	private string _message;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnfirstnameChanging(string value);
    partial void OnfirstnameChanged();
    partial void OnlastnameChanging(string value);
    partial void OnlastnameChanged();
    partial void OntelephoneChanging(int value);
    partial void OntelephoneChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OnsubjectChanging(string value);
    partial void OnsubjectChanged();
    partial void OnmessageChanging(string value);
    partial void OnmessageChanged();
    #endregion
	
	public contactus()
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_firstname", DbType="VarChar(30) NOT NULL", CanBeNull=false)]
	public string firstname
	{
		get
		{
			return this._firstname;
		}
		set
		{
			if ((this._firstname != value))
			{
				this.OnfirstnameChanging(value);
				this.SendPropertyChanging();
				this._firstname = value;
				this.SendPropertyChanged("firstname");
				this.OnfirstnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_lastname", DbType="VarChar(30) NOT NULL", CanBeNull=false)]
	public string lastname
	{
		get
		{
			return this._lastname;
		}
		set
		{
			if ((this._lastname != value))
			{
				this.OnlastnameChanging(value);
				this.SendPropertyChanging();
				this._lastname = value;
				this.SendPropertyChanged("lastname");
				this.OnlastnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_telephone", DbType="Int NOT NULL")]
	public int telephone
	{
		get
		{
			return this._telephone;
		}
		set
		{
			if ((this._telephone != value))
			{
				this.OntelephoneChanging(value);
				this.SendPropertyChanging();
				this._telephone = value;
				this.SendPropertyChanged("telephone");
				this.OntelephoneChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(30) NOT NULL", CanBeNull=false)]
	public string email
	{
		get
		{
			return this._email;
		}
		set
		{
			if ((this._email != value))
			{
				this.OnemailChanging(value);
				this.SendPropertyChanging();
				this._email = value;
				this.SendPropertyChanged("email");
				this.OnemailChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_subject", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string subject
	{
		get
		{
			return this._subject;
		}
		set
		{
			if ((this._subject != value))
			{
				this.OnsubjectChanging(value);
				this.SendPropertyChanging();
				this._subject = value;
				this.SendPropertyChanged("subject");
				this.OnsubjectChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_message", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
	public string message
	{
		get
		{
			return this._message;
		}
		set
		{
			if ((this._message != value))
			{
				this.OnmessageChanging(value);
				this.SendPropertyChanging();
				this._message = value;
				this.SendPropertyChanged("message");
				this.OnmessageChanged();
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