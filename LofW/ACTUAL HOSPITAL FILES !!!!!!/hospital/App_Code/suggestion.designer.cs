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
public partial class suggestionDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertsuggestion(suggestion instance);
  partial void Updatesuggestion(suggestion instance);
  partial void Deletesuggestion(suggestion instance);
  #endregion
	
	public suggestionDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["lynaddisConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public suggestionDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public suggestionDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public suggestionDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public suggestionDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<suggestion> suggestions
	{
		get
		{
			return this.GetTable<suggestion>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.suggestion")]
public partial class suggestion : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _first;
	
	private string _last;
	
	private string _phone;
	
	private string _hours;
	
	private string _email;
	
	private string _comment;
	
	private string _suggestionType;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnfirstChanging(string value);
    partial void OnfirstChanged();
    partial void OnlastChanging(string value);
    partial void OnlastChanged();
    partial void OnphoneChanging(string value);
    partial void OnphoneChanged();
    partial void OnhoursChanging(string value);
    partial void OnhoursChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OncommentChanging(string value);
    partial void OncommentChanged();
    partial void OnsuggestionTypeChanging(string value);
    partial void OnsuggestionTypeChanged();
    #endregion
	
	public suggestion()
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_first", DbType="VarChar(50)")]
	public string first
	{
		get
		{
			return this._first;
		}
		set
		{
			if ((this._first != value))
			{
				this.OnfirstChanging(value);
				this.SendPropertyChanging();
				this._first = value;
				this.SendPropertyChanged("first");
				this.OnfirstChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_last", DbType="VarChar(50)")]
	public string last
	{
		get
		{
			return this._last;
		}
		set
		{
			if ((this._last != value))
			{
				this.OnlastChanging(value);
				this.SendPropertyChanging();
				this._last = value;
				this.SendPropertyChanged("last");
				this.OnlastChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_phone", DbType="NVarChar(50)")]
	public string phone
	{
		get
		{
			return this._phone;
		}
		set
		{
			if ((this._phone != value))
			{
				this.OnphoneChanging(value);
				this.SendPropertyChanging();
				this._phone = value;
				this.SendPropertyChanged("phone");
				this.OnphoneChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_hours", DbType="VarChar(50)")]
	public string hours
	{
		get
		{
			return this._hours;
		}
		set
		{
			if ((this._hours != value))
			{
				this.OnhoursChanging(value);
				this.SendPropertyChanging();
				this._hours = value;
				this.SendPropertyChanged("hours");
				this.OnhoursChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(50)")]
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_comment", DbType="Text", UpdateCheck=UpdateCheck.Never)]
	public string comment
	{
		get
		{
			return this._comment;
		}
		set
		{
			if ((this._comment != value))
			{
				this.OncommentChanging(value);
				this.SendPropertyChanging();
				this._comment = value;
				this.SendPropertyChanged("comment");
				this.OncommentChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_suggestionType", DbType="Text", UpdateCheck=UpdateCheck.Never)]
	public string suggestionType
	{
		get
		{
			return this._suggestionType;
		}
		set
		{
			if ((this._suggestionType != value))
			{
				this.OnsuggestionTypeChanging(value);
				this.SendPropertyChanging();
				this._suggestionType = value;
				this.SendPropertyChanged("suggestionType");
				this.OnsuggestionTypeChanged();
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
