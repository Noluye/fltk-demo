workspace "FltkDemo"
configurations { "Debug", "Release", "Dist" }
	platforms "x86"
	architecture "x86"
	startproject "Sandbox"
	location "project-files"
	configurations
	{
		"Debug",
		"Release",
		"Dist",
	}
	filter "configurations:Debug"
		defines { "DEBUG" }
		runtime "Debug"
		symbols "on"
	filter "configurations:Release or Dist"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"
		symbols "off"

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++latest"
	staticruntime "off"
	targetdir ("bin/%{outputdir}/%{prj.name}")
	objdir ("bin-int/%{outputdir}/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	
	includedirs
	{
		"./vendor/fltk-release-1.3.9/",
	}
	
	libdirs {
		"./vendor/fltk-release-1.3.9/lib/"
	}
	
	filter "configurations:Debug"
		links
		{
			"fltkd.lib",
			"fltkformsd.lib",
			"fltkgld.lib",
			"fltkimagesd.lib",
			"fltkjpegd.lib",
			"fltkpngd.lib",
			"fltkzlibd.lib",
		}
	filter "configurations:Release or Dist"
		links
		{
			"fltk.lib",
			"fltkforms.lib",
			"fltkgl.lib",
			"fltkimages.lib",
			"fltkjpeg.lib",
			"fltkpng.lib",
			"fltkzlib.lib",
		}