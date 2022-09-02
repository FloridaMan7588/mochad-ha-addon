# mochad-homeassistant

[Mochad](https://github.com/sigmdel/mochad) is a TCP bridge between the X-10 Home Automation platform and your home automation system of choice. Of course it's fallen out of maintainership and now rests in the hands of a developer or two, and now I'm one of them! Instead of putting my skills towards the original project, I turned it into a Home Assistant Addon because I love HassIO. Now you, (yes you!), can easily start using your X-10 devices with Home Assistant^*^.
(^*^Terms apply, no purchase neccesary, cancel at anytime)

# Installation

## Prerequisites

To install this addon, you first need a CM15A, CM15Pro, or CM19A. This will allow for communication between your X-10 devices and Home Assistant. You need to have this device plugged into your Home Assistant server, and, if in a hypervisor, properly passed through to the OS. You should be able to see your device in 

`Settings > System > Hardware > (three dots) All Hardware`

If it's not there, check your devices connection and if you've passed everything through properly. If it still doesn't appear, reboot and check again. If you've successfully located your device, copy down it's identifier (usually something like /dev/ttyUSB0 or /dev/ttyAMA0). 

You may also need to enable advanced mode to add repositories to the Add-on store. This is done by going to 

`(your profile, bottom left) > Advanced Mode`

Once you enable Advanced Mode, you can procede to Adding the repository.

## Adding the repository

As this is maintained by me, and me only, it won't be in the community repositories or the official repositories, so you'll have to add mine. To do so, go to

`Settings > Add-Ons > Add-on Store > (three dots) Repoistories`

Once in the repositories dialog, enter <https://github.com/floridaman7588/mochad-ha-addon> and click **add**. Once it's added, click the three dots and click check for updates. Once the Add-on shows up, you can proceed to Installation.

## Installation

Now that you've succesfully added the repository, you should be able to install it. You should probably know how to do that by now, hopefully. If you don't, click on it. That's it. Once that's done, head to the configuration tab of the Add-on. In the Add-On's configuration, under the `serial` section, you'll need to type `port:` followed by the port of your device. It should look similar to this

<code> <b>serial</b> port: /dev/ttyS0 </code>

If it doesn't, you've done something wrong. If it does, great job! Now you should be able to start the addon by going to the info page and clicking **start**

If the addon starts successfully, check the logs and make sure everything is working properly. Assuming it is, you should be able to configure the integration.

## Configuring the Integration
### Disclaimer: I don't maintain this Integration, so any issues should be taken up with the maintainer

To configure the Mochad Integration, you'll need to open your configuration.yaml file in an editor. If you aren't sure how to do this, I'd recommend reading up on the wiki. First you need to add the mochad configuration, then you can start configuring modules. The basic configuration can be added like so

    mochad:
      host: localhost
      port: 1099

This should enable the Integration after a restart, though no devices will be added. This has to be done manually by adding either `light` or `switch` entries to the configuration. To configure a light module (THAT IS EXPLICILY LABELED LAMP MODULE), add the following configuration

    light:
      - platform: mochad
        devices:
          - address: a1
          - address: g7

of course replacing `a1` and `g7` with your Lamp Modules respective devices address. If you have an Appliance Module or transciever, you must add that as a switch. Lamp Modules can be added as a switch, but it would lose dimmer functionality. The configuration for a switch is very similar

    switch:
      - platform: mochad
        devices:
          - address: d4
          - address: b9

Again, replacing the device addresses with your corrosponding devices. Once that's done, give it a reboot and your devices should appear in Home Assistant!

# License

This project is licensed under the GNU General Public License v3, meaning that the user is authorized to make copies of this project, share the code, and modify anything within for no charge. See the LICENSE file for further detail on your rights as pertaining to this project. 

mochad-ha-addon  Copyright &copy; 2022  FloridaMan7588

# Support my work

This may not be the most helpful prject in the world, but it works for me and I hope it works for you. If you would like to support my work, you can 
<p><a href="https://www.buymeacoffee.com/floridaman7588"> <img align="center" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="60" width="210" alt="buy-me-a-coffee-floridaman7588" /></a></p>

or through

<p><a href="https://ko-fi.com/floridaman7588"><img align="center" src="https://uploads-ssl.webflow.com/5c14e387dab576fe667689cf/61e1119ea08f25292239892f_ko-fi%20logo_stroke-p-800.png" height="60" width="210" alt="ko-fi-floridaman7588"/></a></p>